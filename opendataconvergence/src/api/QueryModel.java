package api;

import java.util.ArrayList;

public class QueryModel {

	private int start;
	private int limit;

	private ArrayList<String> Department;
	private ArrayList<String> country;
	private ArrayList<String> state;
	private ArrayList<String> district;
	private ArrayList<String> datasetName;
	private ArrayList<ArrayList<String>> filters;

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

	public QueryModel() {
		// TODO Auto-generated constructor stub
		start = 0;
		limit = 10;

	}

	public ArrayList<String> getDepartment() {
		return Department;
	}

	public void setDepartment(ArrayList<String> department) {
		Department = department;
	}

	public ArrayList<String> getCountry() {
		return country;
	}

	public void setCountry(ArrayList<String> country) {
		this.country = country;
	}

	public ArrayList<String> getState() {
		return state;
	}

	public void setState(ArrayList<String> state) {
		this.state = state;
	}

	public ArrayList<String> getDistrict() {
		return district;
	}

	public void setDistrict(ArrayList<String> district) {
		this.district = district;
	}

	public ArrayList<String> getDatasetName() {
		return datasetName;
	}

	public void setDatasetName(ArrayList<String> datasetName) {
		this.datasetName = datasetName;
	}

	public ArrayList<ArrayList<String>> getFilters() {
		return filters;
	}

	public void setFilters(ArrayList<ArrayList<String>> filters) {
		this.filters = filters;
	}

}
