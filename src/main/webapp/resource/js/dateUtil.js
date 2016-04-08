/**
 * 改变datepicker默认显示日期
 * @param year
 * @param month
 * @param inst
 * @return
 */
function trackMonth(year, month, inst) { 
	var s=inst.selectedMonth+1,d=inst.selectedDay;
	if(s<10){
	s="0"+s
}	if(d<10){
	d="0"+d	
}
$("#"+inst.id).attr("value",getCorrectDay(inst.selectedYear,s,d));
}

/**
 * 获取正确的显示日期
 * @param year
 * @param month
 * @param day
 * @return
 */
function getCorrectDay(year,month,day){
	if(day<=28) return year+"-"+month+"-"+day;
	if(month!=2&&day==31){
		switch(month){
		case 4:
		case 6:
		case 9:
		case 11: day = 30;	
		}
	}
	if(month==2){
		day = isLeapYear(year)?29:28;
	}
    return year+"-"+month+"-"+day;
}

/**
 * 计算平年闰年
 * @param year
 * @return
 */
function isLeapYear(year){
return (year%4==0&&year%100!=0)||(year%400==0);
}

/**
 *获取当前日期
 */
function getCurrentDate(){
   var d, s='';           // 声明变量。
   d = new Date();            
   return (getFormalDate(d));                        
}

function getFormalDate(d){
	var s='';     
   s += d.getFullYear()+"-";
   
   var mon = d.getMonth()+ 1;
   var day = d.getDate() ;
   if(mon <10){
   		s += "0"+ mon + "-"; 
   } else {
   		s += mon + "-"; 
   }
   if(day <10){
   		s += "0"+ day; 
   } else {
   		s += day;
   }           
   return(s);   
}
function getLastMonthDay(){
	var a = new Date()
	a = a.valueOf();
	a = a - 30 * 24 * 60 * 60 * 1000;
	a = new Date(a);
	//return a.getFullYear() + "-" + (a.getMonth() + 1) + "-" + a.getDate();
	return (getFormalDate(a));  
}

//获取最近三个月日期
function getLast3MonthDay(){
	var a = new Date()
	//a = a.valueOf();
	//a = a - 3 * 30 * 24 * 60 * 60 * 1000;
	//a = new Date(a);
	a.setMonth(a.getMonth() - 3);
	//return a.getFullYear() + "-" + (a.getMonth() + 1) + "-" + a.getDate();
	return (getFormalDate(a));  
}
//获取最近半年日期
function getLast6MonthDay(){
	var a = new Date()
	//a = a.valueOf();
	//a = a - 6 * 30 * 24 * 60 * 60 * 1000;
	//a = new Date(a);
	a.setMonth(a.getMonth() - 6);
	//return a.getFullYear() + "-" + (a.getMonth() + 1) + "-" + a.getDate();
	return (getFormalDate(a));  
}

/*** add by  changjun 
 * 获取上周时间***/
function getLastWeekDay(){
	var a = new Date()
	a = a.valueOf();
	a = a - 7* 24 * 60 * 60 * 1000;
	a = new Date(a);
	//return a.getFullYear() + "-" + (a.getMonth() + 1) + "-" + a.getDate();
	return (getFormalDate(a));  
}

