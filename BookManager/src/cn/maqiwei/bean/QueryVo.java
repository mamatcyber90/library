package cn.maqiwei.bean;

public class QueryVo {
	//当前页
	private Integer page;
	//每页数
	private Integer size = 10; 
	//开始行
	private Integer startRow = 0;

	//书籍名称
	private String bkName;

	public String getBkName() {
		return bkName;
	}

	public void setBkName(String bkName) {
		this.bkName = bkName;
	}

	public Integer getStartRow() {
		return startRow;
	}
	public void setStartRow(Integer startRow) {
		this.startRow = startRow;
	}

	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getSize() {
		return size;
	}
	public void setSize(Integer size) {
		this.size = size;
	}
	
	
	
	
	

}
