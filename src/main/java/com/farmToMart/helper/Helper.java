package com.farmToMart.helper;

public class Helper {

		
	public static String get10Words(String desc) {
		
		String[] ans=desc.split(" ");

		if(ans.length>10) {
			
			String final_ans = null;
			for(int i=0;i<10;i++) {
				final_ans=ans[i]+" "+final_ans;
			}
			
			return final_ans+"...";
			
		}
		else {
			return desc;
		}
		
		
	}
}
