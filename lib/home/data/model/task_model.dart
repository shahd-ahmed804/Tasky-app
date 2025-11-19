class TaskModel{
  static const String collectionName = 'tasks';
 String? id;
 String? title;
 String? description;
 DateTime? date;
 int? priority;
 bool? isCompleted;
 TaskModel({
    this.id,
   this.title,
    this.description,
    this.date,
    this.priority,
   this.isCompleted=false,
});
 Map<String,dynamic> toJson(){
   return {
     'id':id,
     'title':title,
     'description':description,
     'date':date?.millisecondsSinceEpoch,
     'priority':priority,
     'isCompleted':isCompleted,
   };
 }
 factory TaskModel.fromJson(Map<String,dynamic> json){
   return TaskModel(
     id: json['id'],
     title: json['title'],
     description : json['description'],
     date:DateTime.fromMillisecondsSinceEpoch( json['date']),
     priority: json['priority'],
     isCompleted: json['isCompleted'],
   );
 }
}



