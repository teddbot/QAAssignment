import json
import glob
import os

results = []
for filename in glob.glob('*.json'):
    with open(filename) as f:
        results.append(json.load(f))

# Generate a simple HTML report
report = """
<html>
<head>
    <title>K6 Performance Test Report</title>
</head>
<body>
    <h1>K6 Performance Test Report</h1>
    <table border="1">
        <tr>
            <th>Test</th>
            <th>Requests</th>
            <th>Failures</th>
            <th>Duration</th>
        </tr>
"""

for result in results:
    summary = result['metrics']['http_req_duration']
    report += f"""
        <tr>
            <td>{os.path.basename(result['name'])}</td>
            <td>{summary['count']}</td>
            <td>{summary['failed']}</td>
            <td>{summary['total']}</td>
        </tr>
    """

report += """
    </table>
</body>
</html>
"""

with open('log/index.html', 'w') as f:
    f.write(report)
