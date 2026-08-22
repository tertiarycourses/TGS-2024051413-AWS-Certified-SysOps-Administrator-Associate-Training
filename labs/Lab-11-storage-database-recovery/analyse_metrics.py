import csv, statistics
rows=list(csv.DictReader(open('data/metrics.csv')))
for key in ('cpu_pct','ebs_queue','iops','throughput_mib_s','db_connections','p95_latency_ms'):
    values=[float(r[key]) for r in rows]
    print(f'{key}: min={min(values):.1f} max={max(values):.1f} mean={statistics.mean(values):.1f}')
assert max(float(r['ebs_queue']) for r in rows) > 8
print('LAB 11 METRIC ANALYSIS PASS')
