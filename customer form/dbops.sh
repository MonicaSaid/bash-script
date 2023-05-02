## Function, takes customer name, and prints out the id, name, and email. Returns 0 if found, otherwise return 1
function queryCustomer {
	local CUSTNAME=${1}
	LINE=$(grep "${CUSTNAME}" customers.db)
	[ -z ${LINE} ] && printErrorMsg "Sorry, ${CUSTNAME} is not found" && return 7
	echo "Information for the customer"
	echo -e "\t ${LINE}"
	return 0
}


#Function to update customer email 
function EmailUpdate {
	CID=${1}
	CEMAIL=${2}
	OLDRECORD=$(grep "^${CID}:" customers.db)
	OLDMAIL=$(echo ${OLDRECORD} | awk 'BEGIN{FS=":"} {print $3}')
	sed -i "s/${OLDMAIL}/${CEMAIL}/" customers.db
}


#Function to delete user
function DeleteCus {
	ID=${1}
	LINE=$(grep "^${ID}:" customers.db)
	sed -i "s/$LINE//" customers.db
}
