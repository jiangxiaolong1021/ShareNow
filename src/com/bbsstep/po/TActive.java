package com.bbsstep.po;

public class TActive {
	private Long id;

	private Long userid;

	private String activename;

	private Long type;

	private String startdate;

	private String enddate;

	private String province;

	private String city;

	private String address;

	private Float longitude;

	private Float latitude;

	private Float radius;

	private String addr;

	private String praise;

	private String steps;

	private Integer activestatus;

	private Integer activepower;

	private String createdate;

	private String updatedate;

	private Integer activesex;

	private Integer joinnum;

	// 是否删除
	private Integer isdelete;
	// 群聊id
	private String hxgroupid;

	private Float cost;

	private Float commission;

	private String username;

	private String nickname;

	private String typename;

	private String content;

	private String requireName;
	private String requireComp;
	private String requirePosition;
	private String requireMobile;
	private int displayOrder;
	// 统计
	private Integer partnum;// 参与人数
	private Integer collectnum;// 活动收藏人数
	private Integer msgnum;// 评论人数
	private Float totalCost;// �?售�?�额

	// 新增字段 2017-2-13�? 活动�?大参与人�?
	private Integer maxnum;

	// 查视图新增字段iconurl--头像
	private String iconurl;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getUserid() {
		return userid;
	}

	public void setUserid(Long userid) {
		this.userid = userid;
	}

	public String getActivename() {
		return activename;
	}

	public void setActivename(String activename) {
		this.activename = activename == null ? null : activename.trim();
	}

	public Long getType() {
		return type;
	}

	public void setType(Long type) {
		this.type = type;
	}

	public String getStartdate() {
		return startdate;
	}

	public void setStartdate(String startdate) {
		this.startdate = startdate == null ? null : startdate.trim();
	}

	public String getEnddate() {
		return enddate;
	}

	public void setEnddate(String enddate) {
		this.enddate = enddate == null ? null : enddate.trim();
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province == null ? null : province.trim();
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city == null ? null : city.trim();
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address == null ? null : address.trim();
	}

	public Float getLongitude() {
		return longitude;
	}

	public void setLongitude(Float longitude) {
		this.longitude = longitude;
	}

	public Float getLatitude() {
		return latitude;
	}

	public void setLatitude(Float latitude) {
		this.latitude = latitude;
	}

	public Float getRadius() {
		return radius;
	}

	public void setRadius(Float radius) {
		this.radius = radius;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr == null ? null : addr.trim();
	}

	public String getPraise() {
		return praise;
	}

	public void setPraise(String praise) {
		this.praise = praise == null ? null : praise.trim();
	}

	public String getSteps() {
		return steps;
	}

	public void setSteps(String steps) {
		this.steps = steps == null ? null : steps.trim();
	}

	public Integer getActivestatus() {
		return activestatus;
	}

	public void setActivestatus(Integer activestatus) {
		this.activestatus = activestatus;
	}

	public Integer getActivepower() {
		return activepower;
	}

	public void setActivepower(Integer activepower) {
		this.activepower = activepower;
	}

	public String getCreatedate() {
		return createdate;
	}

	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}

	public String getUpdatedate() {
		return updatedate;
	}

	public void setUpdatedate(String updatedate) {
		this.updatedate = updatedate;
	}

	public Integer getActivesex() {
		return activesex;
	}

	public void setActivesex(Integer activesex) {
		this.activesex = activesex;
	}

	public Integer getJoinnum() {
		return joinnum;
	}

	public void setJoinnum(Integer joinnum) {
		this.joinnum = joinnum;
	}

	public Float getCost() {
		return cost;
	}

	public void setCost(Float cost) {
		this.cost = cost;
	}

	public Float getCommission() {
		return commission;
	}

	public void setCommission(Float commission) {
		this.commission = commission;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content == null ? null : content.trim();
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getTypename() {
		return typename;
	}

	public void setTypename(String typename) {
		this.typename = typename;
	}

	public Integer getIsdelete() {
		return isdelete;
	}

	public void setIsdelete(Integer isdelete) {
		this.isdelete = isdelete;
	}

	public String getHxgroupid() {
		return hxgroupid;
	}

	public void setHxgroupid(String hxgroupid) {
		this.hxgroupid = hxgroupid;
	}

	public String getRequireName() {
		return requireName;
	}

	public void setRequireName(String requireName) {
		this.requireName = requireName;
	}

	public String getRequireComp() {
		return requireComp;
	}

	public void setRequireComp(String requireComp) {
		this.requireComp = requireComp;
	}

	public String getRequirePosition() {
		return requirePosition;
	}

	public void setRequirePosition(String requirePosition) {
		this.requirePosition = requirePosition;
	}

	public String getRequireMobile() {
		return requireMobile;
	}

	public void setRequireMobile(String requireMobile) {
		this.requireMobile = requireMobile;
	}

	public int getDisplayOrder() {
		return displayOrder;
	}

	public void setDisplayOrder(int displayOrder) {
		this.displayOrder = displayOrder;
	}

	public Integer getPartnum() {
		return partnum;
	}

	public void setPartnum(Integer partnum) {
		this.partnum = partnum;
	}

	public Integer getCollectnum() {
		return collectnum;
	}

	public void setCollectnum(Integer collectnum) {
		this.collectnum = collectnum;
	}

	public Integer getMsgnum() {
		return msgnum;
	}

	public void setMsgnum(Integer msgnum) {
		this.msgnum = msgnum;
	}

	public Float getTotalCost() {
		return totalCost;
	}

	public void setTotalCost(Float totalCost) {
		this.totalCost = totalCost;
	}

	public Integer getMaxnum() {
		return maxnum;
	}

	public void setMaxnum(Integer maxnum) {
		this.maxnum = maxnum;
	}

	public String getIconurl() {
		return iconurl;
	}

	public void setIconurl(String iconurl) {
		this.iconurl = iconurl;
	}
}