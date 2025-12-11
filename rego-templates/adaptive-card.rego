package postee.adaptivecard

import data.postee.with_default

# Title for the notification - used by Postee output
default title = "Aqua Security Notification"

title = t {
    input.title
    t := input.title
}

title = t {
    not input.title
    input.image
    t := sprintf("Aqua Security | Image Scan | %s", [input.image])
}

title = t {
    not input.title
    not input.image
    input.response_policy_name
    t := sprintf("Aqua Security | %s", [input.response_policy_name])
}

title = t {
    not input.title
    not input.image
    not input.response_policy_name
    input.issue_details.name
    t := sprintf("Aqua Security | Issue | %s", [input.issue_details.name])
}

title = t {
    not input.title
    not input.image
    not input.response_policy_name
    not input.issue_details
    input.insight.id
    t := sprintf("Aqua Security | Insight | %s", [input.insight.id])
}

title = t {
    not input.title
    not input.image
    not input.response_policy_name
    not input.issue_details
    not input.insight
    input.name
    input.category
    t := sprintf("Aqua Security | Incident | %s", [input.name])
}

# Result passes through the raw JSON input for the Go code to build the Adaptive Card
# The Go code in teams/teams_workflows.go handles the actual card building
result = json.marshal(input)

