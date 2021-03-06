<?php
namespace Addons\Core\HTTP;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\File\File;
use Symfony\Component\HttpFoundation\File\Exception\FileException;
use Symfony\Component\HttpFoundation\BinaryFileResponse as BaseBinaryFileResponse;

class BinaryFileResponse extends BaseBinaryFileResponse {

	/**
	 * Automatically sets the ETag header according to the checksum of the file.
	 */
	public function setAutoEtag()
	{
		$this->setEtag(md5(serialize(fileinfo($this->file->getPathname()))));
		return $this;
	}


	/**
	 * Sets the file to stream.
	 *
	 * @param \SplFileInfo|string $file               The file to stream
	 * @param string              $contentDisposition
	 * @param bool                $autoEtag
	 * @param bool                $autoLastModified
	 *
	 * @return BinaryFileResponse
	 *
	 * @throws FileException
	 */
	public function setFile($file, $contentDisposition = null, $etag = false, $lastModified = true)
	{
		if (!$file instanceof File) {
			if ($file instanceof \SplFileInfo) {
				$file = new File($file->getPathname());
			} else {
				$file = new File((string) $file);
			}
		}

		if (!$file->isReadable()) {
			throw new FileException('File must be readable.');
		}

		$this->file = $file;

		if ($etag === true)
			$this->setAutoEtag();
		elseif (!empty($etag))
			$this->setEtag($etag);
		

		if ($lastModified === true)
			$this->setAutoLastModified();
		elseif (!empty($lastModified))
		{
			is_numeric($lastModified) && $lastModified = '@'.$lastModified;
			$this->setLastModified(new \DateTime($lastModified));
		}

		if ($contentDisposition)
			$this->setContentDisposition($contentDisposition);


		return $this;
	}

	/**
	 * {@inheritdoc}
	 */
	public function prepare(Request $request)
	{

		parent::prepare($request);

		if (!empty($_SERVER['HTTP_IF_NONE_MATCH']) && trim($_SERVER['HTTP_IF_NONE_MATCH']) == $this->getEtag())
		{
			$this->setStatusCode(304);
			$this->maxlen = 0;
		}
		else if (!empty($_SERVER['HTTP_IF_MODIFIED_SINCE']))
		{
			$lastModified = $this->getLastModified();
			$lastModified instanceof \DateTime && $lastModified = $lastModified->getTimeStamp();
			if (strtotime($_SERVER['HTTP_IF_MODIFIED_SINCE']) >= $lastModified)
			{
				$this->setStatusCode(304);
				$this->maxlen = 0;
			}
		} else {
			switch (substr($_SERVER['SERVER_SOFTWARE'], 0, (int)strpos($_SERVER['SERVER_SOFTWARE'],'/'))) {
				case 'nginx':
					$this->headers->set('X-Accel-Redirect', env('APP_PATH').'/'.relative_path($this->file->getPathname(), APPPATH));
					$this->headers->set('X-Accel-Buffering', 'yes');
					//$this->headers->set('X-Accel-Limit-Rate', '102400'); //速度限制 Byte/s
					//$this->headers('Accept-Ranges', 'none');//单线程 限制多线程
					$this->maxlen = 0;
					break;
				case 'Apache':
					if (function_exists('apache_get_modules') && in_array('mod_xsendfile', apache_get_modules()))
					{
						$this->headers->set('X-Sendfile', $this->file->getPathname());
						$this->maxlen = 0;
					}
					break;
				case 'squid':
					$this->headers->set('X-Accelerator-Vary', $this->file->getPathname());
					$this->maxlen = 0;
					break;
				case 'lighttpd':
					$this->headers->set('X-LIGHTTPD-send-file', $this->file->getPathname());
					$this->maxlen = 0;
					break;
			}
		
		}
		return $this;
	}
}