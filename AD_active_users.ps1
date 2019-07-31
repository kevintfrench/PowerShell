search-ADAccount -accountinactive -datetime "09/3/2016" -staffonly

##OR

Search-ADAccount -AccountInactive -DateTime "09/03/2017" | Export-Csv -Path "inactiveUsers.csv"