class expances_model
{
  late String id,reasons,expances_date,total_price;
  expances_model(this.id, this.reasons, this.expances_date,this.total_price);
  expances_model.fromJson(Map<String,dynamic> json)
  {
    id=json['id'];
    reasons=json['reasons'];
    expances_date=json['expances_date'];
    total_price=json['total_price'];
  }

  Map<String,dynamic>? tojson()
  {
    final Map<String,dynamic> data=new Map<String,dynamic>();
    data['id']=this.id;
    data['reasons']=this.reasons;
    data['expances_date']=this.expances_date;
    data['total_price']=this.total_price;
  }
}