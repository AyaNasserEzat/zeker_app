


abstract class AddZikerStates  {

}

/// الحالة الأولية (مفيش أي حاجة لسه حصلت)
class AddZikerInitial extends AddZikerStates {}

/// أثناء إضافة الذكر (ممكن تظهر لودنج)
class AddZikerLoading extends AddZikerStates {}

/// تمت إضافة الذكر بنجاح
class AddZikerSuccess extends AddZikerStates {
  final String message;
  AddZikerSuccess({this.message = "تمت إضافة الذكر بنجاح"});

  
}

/// حصل خطأ أثناء الإضافة
class AddZikerError extends AddZikerStates {
  final String error;
  AddZikerError(this.error);


}

class FetchAllZikerSuccess extends AddZikerStates{

}
class IncreamentZikerSuccess extends AddZikerStates{

}
class ZeroZikerSuccess extends AddZikerStates{

}

