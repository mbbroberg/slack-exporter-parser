# Parse Slack Exports
An embarrassingly brute-force-but-effective tool for parsing the output of Slack's Export tool. 

## Steps to do the thing :neckbeard:

### Snag an OAuth tokens

Get yo'self one here: https://api.slack.com/docs/oauth-test-tokens

Export it on whatever command-line you'll run this on: 

```
$ export SLACK_API_TOKEN="xox-TOKEN-HERE"
``` 

### Export all the datas

Head here and then download the zip: https://<YOURTEAM>.slack.com/services/export

Unzip it locally and move the `channels.json` file to the same folder as this tool. So: 

```
$ git clone git@github.com:mbbroberg/slack-exporter-parser.git 
$ cp channels.json slack-exporter-parser/
$ cd slack-exporter-parser
$ ruby parse.rb > channels.csv
```

Boom. You have a file you can use to audit existing channels. And if you have Primary Owner status, you'll also have access to Private channels (see more below)

<img width="911" alt="What You Get From Exporting" src="https://cloud.githubusercontent.com/assets/1744971/21877680/92903dd4-d841-11e6-8aad-e98517a31cab.png">
