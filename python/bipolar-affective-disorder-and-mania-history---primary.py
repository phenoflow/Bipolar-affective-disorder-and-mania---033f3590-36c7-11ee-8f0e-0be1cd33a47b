# Kuan V, Denaxas S, Gonzalez-Izquierdo A, Direk K, Bhatti O, Husain S, Sutaria S, Hingorani M, Nitsch D, Parisinos C, Lumbers T, Mathur R, Sofat R, Casas JP, Wong I, Hemingway H, Hingorani A, 2023.

import sys, csv, re

codes = [{"code":"ZV11111","system":"readv2"},{"code":"ZV11112","system":"readv2"},{"code":"11548.0","system":"med"},{"code":"22080.0","system":"med"},{"code":"23963.0","system":"med"},{"code":"24230.0","system":"med"},{"code":"27584.0","system":"med"},{"code":"37178.0","system":"med"},{"code":"55064.0","system":"med"},{"code":"57465.0","system":"med"},{"code":"63784.0","system":"med"},{"code":"70000.0","system":"med"},{"code":"85102.0","system":"med"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('bipolar-affective-disorder-and-mania-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["bipolar-affective-disorder-and-mania-history---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["bipolar-affective-disorder-and-mania-history---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["bipolar-affective-disorder-and-mania-history---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
