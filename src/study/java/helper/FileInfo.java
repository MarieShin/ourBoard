package study.java.helper;

public class FileInfo {
	private String fieldName;
	private String orginName;
	private String fileDir;
	private String fileName;
	private String contentType;
	private long fileSize;

	public FileInfo() {
		super();
	}
	
	public FileInfo(String fieldName, String orginName, String fileDir, String fileName, String contentType,
			long fileSize) {
		super();
		this.fieldName = fieldName;
		this.orginName = orginName;
		this.fileDir = fileDir;
		this.fileName = fileName;
		this.contentType = contentType;
		this.fileSize = fileSize;
	}

	public String getFieldName() {
		return fieldName;
	}

	public void setFieldName(String fieldName) {
		this.fieldName = fieldName;
	}

	public String getOrginName() {
		return orginName;
	}

	public void setOrginName(String orginName) {
		this.orginName = orginName;
	}

	public String getFileDir() {
		return fileDir;
	}

	public void setFileDir(String fileDir) {
		this.fileDir = fileDir;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getContentType() {
		return contentType;
	}

	public void setContentType(String contentType) {
		this.contentType = contentType;
	}

	public long getFileSize() {
		return fileSize;
	}

	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}

	@Override
	public String toString() {
		return "FileInfo [fieldName=" + fieldName + ", orginName=" + orginName + ", fileDir=" + fileDir + ", fileName="
				+ fileName + ", contentType=" + contentType + ", fileSize=" + fileSize + "]";
	}

}
