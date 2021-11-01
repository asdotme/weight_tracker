class UtilView {
  static getFormattedDate(String date){
    dynamic dateParse = DateTime.parse(date);
    String formattedDate = "${dateParse.year}-${dateParse.month}-${dateParse.day}";

    return formattedDate;
  }
}