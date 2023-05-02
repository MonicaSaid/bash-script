DBHOST="192.168.180.150"
DBUSER="test_user"
DBPASS="password1234"


## Function, takes customer name, and prints out the id, name, and email. Returns 0 if found, otherwise return 1

function queryCustomer {
	DBPASS="password1234"
	local CUSTNAME=${1}
	LINE=$(mysql -u ${DBUSER} -p${DBPASS} -h ${DBHOST} -e "select * from  monica.customers where name='${CUSTNAME}';")
	[ -z ${LINE} ] && printErrorMsg "Sorry, ${CUSTNAME} is not found" && return 7
	echo "Information for the customer"
	echo -e "\t ${LINE}"
	return 0
}


#Function to update customer email 
function EmailUpdate {
	DBPASS="password1234"
	CID=${1}
	CEMAIL=${2}
	mysql -h ${DBHOST} -u ${DBUSER} -p${DBPASS} -e "update monica.customers set email='${CEMAIL}' where id=${CID};"

}


#Function to delete user
function DeleteCus {
	DBPASS="password1234"
	ID=${1}
	mysql -u ${DBUSER} -p${DBPASS} -h ${DBHOST} -e "delete from monica.customers where id=${ID};"
}
