# http://mohit.ueuo.com/AWK_Scripts/droppackets.awk


BEGIN {

start_time = 0;

count = 0;

}

{

action = $1;

time = $2;

node_id = $3;

layer = $4;

flags = $5;

seqno = $6;

type = $7;

size = $8;

a = $9;

b = $10;

c = $11;

d = $12;

energy = $14;

for(seqno = 0; seqno < 68; seqno++) {

if(node_id = "_4_" && action == "D" && layer == "IFQ" && type == "TCP") {

count++;

start_time = time;

printf("%f\t%d\n",start_time,count);

}

}

}

END {

}
