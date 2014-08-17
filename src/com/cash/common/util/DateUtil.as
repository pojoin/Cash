package com.cash.common.util
{
	import mx.formatters.DateFormatter;
	
	public class DateUtil
	{
		
		public static var YYYY_MM_DD:String = "YYYY-MM-DD";
		
		/**
		 * 将时间转换成字符串
		 */
		public static function convertDateToString(date:Date,formatStr:String):String{
			var format:DateFormatter = new DateFormatter();
			format.formatString = formatStr;
			return format.format(date);
		}

	}
}