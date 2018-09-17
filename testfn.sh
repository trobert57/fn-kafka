#echo -n '{"emp_email": "a@b.com","emp_name": "Thomas","emp_dept": "Product Divison"}' | fn invoke --link kafkahost fn-kafka-app fn-kafka-app-send-func 
echo -n '{"emp_email": "a@hamburg.com","emp_name": "Thomas","emp_dept": "`date`"}' | fn invoke fn-kafka-app fn-kafka-app-send-func 
#curl -d '{"emp_email": "a@curl.com","emp_name": "Thomas","emp_dept": "Product Divison"}' http://localhost:8080/t/fn-kafka-app/fn-kafka-app-send-func
