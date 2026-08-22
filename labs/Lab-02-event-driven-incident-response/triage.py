import json

def handler(event, context):
    detail = event.get('detail', {})
    record = {
        'event_id': event.get('id'),
        'time': event.get('time'),
        'event_name': detail.get('eventName'),
        'actor': detail.get('userIdentity', {}).get('arn'),
        'resource': detail.get('requestParameters', {}).get('groupId'),
        'action': 'TRIAGE_ONLY_NO_AUTOMATIC_NETWORK_CHANGE',
    }
    print(json.dumps(record, sort_keys=True))
    return {'statusCode': 200, 'body': record}
