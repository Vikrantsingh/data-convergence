package rdbms;

public class LocationIndexModel {
	private String country;
	private String state;
	private String district;
	private String department;
	private String dataset_name;
	private String time_stamp;
	private int location_index_id;
	
	
	
	
	public int getLocation_index_id() {
		return location_index_id;
	}

	public void setLocation_index_id(int location_index_id) {
		this.location_index_id = location_index_id;
	}

	public String getTime_stamp() {
		return time_stamp;
	}

	public void setTime_stamp(String time_stamp) {
		this.time_stamp = time_stamp;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getDistrict() {
		return district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getDataset_name() {
		return dataset_name;
	}

	public void setDataset_name(String dataset_name) {
		this.dataset_name = dataset_name;
	}

}
