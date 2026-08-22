import csv, pathlib
rows=list(csv.DictReader(open('data/events.csv')))
rows.sort(key=lambda r:r['timestamp'])
pathlib.Path('output').mkdir(exist_ok=True)
with open('output/timeline.csv','w',newline='') as f:
    w=csv.DictWriter(f,fieldnames=rows[0]); w.writeheader(); w.writerows(rows)
assert len({r['event_id'] for r in rows})==len(rows)
print('LAB 12 TIMELINE PASS')
