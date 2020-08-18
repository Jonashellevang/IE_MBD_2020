# -*- coding: utf-8 -*-
"""
Created on Mon Feb 24 08:54:58 2020

@author: jonas
"""

#%% 

#1. (2 points) Create a function read_savings_data that reads the file named bank.csv and returns a list of dictionaries, where each element of the list should have the form:
#{
#  "name": "Leroy",
#  "savings": "$7883.30",
#  "country": "DE"
#}

import csv
import json

#%%

file_path = "/Users/Jonas/Documents/MBDLocal/Python/bank.csv"

#%%

def read_savings_data(file_path):
    with open(file_path) as file:
        reader = csv.DictReader(file)
        list_dictionary = list(reader)
                    
        return list_dictionary
            

bank_data = read_savings_data(file_path)

#%%%

def calculate_total_savings(list_dictionary):
    total_saving = 0
    for i in list_dictionary:
        savings = float(i["savings"].replace("$",""))
        total_saving = total_saving + savings
        
    return total_saving
 
    
    
prueba = calculate_total_savings(bank_data)
print(prueba)

#%%

def richest_person(list_dictionary):
    richest_person = ""
    richest_saving = 0
    for i in list_dictionary:
        savings = float(i["savings"].replace("$",""))
        if savings > richest_saving:
            richest_saving = savings
            richest_person = i["name"]
    return richest_person
 
    
    
prueba2 = richest_person(bank_data)
print(prueba2)

#%%

def poorest_person(list_dictionary):
    richest_name = richest_person(list_dictionary)
    poorest_person = ""
    
    for i in list_dictionary:
        savings = float(i["savings"].replace("$",""))
        if richest_name == "Alejandro":
            poorest_amount = savings
            
    for i in list_dictionary:
        savings = float(i["savings"].replace("$",""))
        if savings < poorest_amount:
            poorest_amount = savings
            poorest_person = i["name"]
    return poorest_person
            
    
    
prueba3 = poorest_person(bank_data)
print(prueba3)

#%%


def get_all_countries(list_dictionary):
    get_all_countries = []
    for i in list_dictionary:
        if i["country"] not in get_all_countries:
            get_all_countries.append(i["country"])
    
    return get_all_countries

prueba4 = get_all_countries(bank_data)
print(prueba4)

#%%

def calculate_average_savings(list_dictionary):
    calculate_average_savings = calculate_total_savings(list_dictionary)/len(list_dictionary)
    return calculate_average_savings

   
    
prueba5 = calculate_average_savings(bank_data)
print(prueba5)

#%%

def people_per_country(list_dictionary):
    people_per_country = {}
    for i in list_dictionary:
        if i["country"] in people_per_country:
            people_per_country[i["country"]] =  people_per_country[i["country"]] + 1
        else:
            people_per_country[i["country"]] = 1 
    
    return people_per_country

prueba6 = people_per_country(bank_data)
print(prueba6)

#%%

def write_report(list_dictionary):
    jsondocument = {}
    jsondocument["total_savings"] = calculate_total_savings(list_dictionary)
    jsondocument["richest_person"] = richest_person(list_dictionary)
    jsondocument["poorest_person"] = poorest_person(list_dictionary)
    jsondocument["all_countries"] = get_all_countries(list_dictionary)
    jsondocument["average_savings"] = calculate_average_savings(list_dictionary)
    jsondocument["people_per_country"] = people_per_country(list_dictionary)
    
    with open ("/Users/Jonas/Documents/MBDLocal/Python/report.json" , "w") as file:
        json.dump(jsondocument, file)

write_report(bank_data)
#%%
