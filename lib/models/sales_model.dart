class sales_model
{
  late String id,retailer_name,base_price,quantity,total_price,due_date,advance,contact;
  sales_model(this.id, this.retailer_name, this.base_price,this.quantity,this.total_price,this.due_date,this.advance,this.contact);


  sales_model.fromJson(Map<String,dynamic> json)
  {
    id=json['id'];
    retailer_name=json['retailer_name'];
    base_price=json['base_price'];
    quantity=json['quantity'];
    total_price=json['total_price'];
    due_date=json['due_date'];
    advance=json['advance'];
    contact=json['contact'];
  }

  Map<String,dynamic>? tojson()
  {
    final Map<String,dynamic> data=new Map<String,dynamic>();
    data['id']=this.id;
    data['retailer_name']=this.retailer_name;
    data['base_price']=this.base_price;
    data['quantity']=this.quantity;
    data['total_price']=this.total_price;
    data['due_date']=this.due_date;
    data['advance']=this.advance;
    data['contact']=this.contact;
  }
}