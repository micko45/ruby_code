require 'adif'

data = ADIF.parse_adi("<call:6>WN4AZY<band:3>20M<mode:4>RTTY<qso_date:8>19960513<time_on:4>1305<eor>").records
record = data[0]

p record
p record[:call]
