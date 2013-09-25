package api2;

import java.util.ArrayList;
import java.util.HashMap;

import rdbms.LocationIndexModel;

/**
 * @author Vikee
 *
 */
public class QueryModel {

	private int start;
	private int limit;

	private HashMap <Integer,LocationIndexModel> LocationIndex;
	
	private ArrayList<Integer> location_index_id;
	
	private ArrayList<Integer> dataset_key_id;
	
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


	public ArrayList<Integer> getLocation_index_id() {
		return location_index_id;
	}

	public void setLocation_index_id(ArrayList<Integer> location_index_id) {
		this.location_index_id = location_index_id;
	}

	public ArrayList<ArrayList<String>> getFilters() {
		return filters;
	}

	public void setFilters(ArrayList<ArrayList<String>> filters) {
		this.filters = filters;
	}

	public ArrayList<Integer> getDataset_key_id() {
		return dataset_key_id;
	}

	public void setDataset_key_id(ArrayList<Integer> dataset_key_id) {
		this.dataset_key_id = dataset_key_id;
	}

	public HashMap<Integer, LocationIndexModel> getLocationIndex() {
		return LocationIndex;
	}

	public void setLocationIndex(HashMap<Integer, LocationIndexModel> locationIndex) {
		LocationIndex = locationIndex;
	}


}
