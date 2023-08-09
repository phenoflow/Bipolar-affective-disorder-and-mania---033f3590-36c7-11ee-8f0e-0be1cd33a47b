# Kuan V, Denaxas S, Gonzalez-Izquierdo A, Direk K, Bhatti O, Husain S, Sutaria S, Hingorani M, Nitsch D, Parisinos C, Lumbers T, Mathur R, Sofat R, Casas JP, Wong I, Hemingway H, Hingorani A, 2023.

import sys, csv, re

codes = [{"code":"103915.0","system":"med"},{"code":"104051.0","system":"med"},{"code":"104065.0","system":"med"},{"code":"109485.0","system":"med"},{"code":"11596.0","system":"med"},{"code":"12173.0","system":"med"},{"code":"12831.0","system":"med"},{"code":"13024.0","system":"med"},{"code":"14728.0","system":"med"},{"code":"14784.0","system":"med"},{"code":"1531.0","system":"med"},{"code":"15923.0","system":"med"},{"code":"16347.0","system":"med"},{"code":"16562.0","system":"med"},{"code":"16808.0","system":"med"},{"code":"17385.0","system":"med"},{"code":"18909.0","system":"med"},{"code":"19967.0","system":"med"},{"code":"20110.0","system":"med"},{"code":"21065.0","system":"med"},{"code":"22713.0","system":"med"},{"code":"23713.0","system":"med"},{"code":"24640.0","system":"med"},{"code":"24689.0","system":"med"},{"code":"26161.0","system":"med"},{"code":"26227.0","system":"med"},{"code":"26299.0","system":"med"},{"code":"2741.0","system":"med"},{"code":"27739.0","system":"med"},{"code":"27890.0","system":"med"},{"code":"27986.0","system":"med"},{"code":"28277.0","system":"med"},{"code":"28677.0","system":"med"},{"code":"29451.0","system":"med"},{"code":"30282.0","system":"med"},{"code":"31316.0","system":"med"},{"code":"31535.0","system":"med"},{"code":"32088.0","system":"med"},{"code":"32295.0","system":"med"},{"code":"33426.0","system":"med"},{"code":"33751.0","system":"med"},{"code":"35607.0","system":"med"},{"code":"35734.0","system":"med"},{"code":"35738.0","system":"med"},{"code":"36126.0","system":"med"},{"code":"36611.0","system":"med"},{"code":"3702.0","system":"med"},{"code":"37070.0","system":"med"},{"code":"37102.0","system":"med"},{"code":"37296.0","system":"med"},{"code":"43093.0","system":"med"},{"code":"44513.0","system":"med"},{"code":"44693.0","system":"med"},{"code":"46415.0","system":"med"},{"code":"46425.0","system":"med"},{"code":"46434.0","system":"med"},{"code":"4677.0","system":"med"},{"code":"4678.0","system":"med"},{"code":"4732.0","system":"med"},{"code":"48632.0","system":"med"},{"code":"49763.0","system":"med"},{"code":"50218.0","system":"med"},{"code":"51032.0","system":"med"},{"code":"53840.0","system":"med"},{"code":"54195.0","system":"med"},{"code":"55829.0","system":"med"},{"code":"57605.0","system":"med"},{"code":"58863.0","system":"med"},{"code":"59011.0","system":"med"},{"code":"60178.0","system":"med"},{"code":"63150.0","system":"med"},{"code":"63284.0","system":"med"},{"code":"63583.0","system":"med"},{"code":"63651.0","system":"med"},{"code":"63698.0","system":"med"},{"code":"63701.0","system":"med"},{"code":"65811.0","system":"med"},{"code":"66153.0","system":"med"},{"code":"6710.0","system":"med"},{"code":"68326.0","system":"med"},{"code":"68647.0","system":"med"},{"code":"6874.0","system":"med"},{"code":"70399.0","system":"med"},{"code":"70721.0","system":"med"},{"code":"70925.0","system":"med"},{"code":"72026.0","system":"med"},{"code":"73423.0","system":"med"},{"code":"73924.0","system":"med"},{"code":"8567.0","system":"med"},{"code":"9521.0","system":"med"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('bipolar-affective-disorder-and-mania-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["mania---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["mania---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["mania---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
