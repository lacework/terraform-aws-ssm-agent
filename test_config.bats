#!/usr/bin/env bats

@test "Validate json with no args" {
    local path=$(pwd)
    local result=$(bash -c "source setup_lacework_agent.sh && render_agent_config $path")

    local config="${path}/config/config.json"
    local validateJson=$(jsonlint $config)
    echo $validateJson >&3

    local status=$?

    [ $status -eq 0 ] 
}

@test "Validate json with additonal config" {
    local path=$(pwd)
    local addCfg='"{\"codeaware\": {\"enable\":\"all\" }}"'
    local result=$(bash -c "source setup_lacework_agent.sh && render_agent_config $path $addCfg")
    local config="${path}/config/config.json"
    jsonlint $config
    local status=$?

    [ $status -eq 0 ] 
}

@test "Validate json with all config" {
    local path=$(pwd)
    local addCfg='"{\"codeaware\": {\"enable\":\"all\" }}"'
    local serverUrl="https://agent.lacework.net"
    local tags='"{\"env\": \"dev\"}"'
    local result=$(bash -c "source setup_lacework_agent.sh && render_agent_config $path $addCfg $serverUrl, $tags")
    local config="${path}/config/config.json"
    jsonlint $config
    local status=$?
    
    echo $status
    [ $status -eq 0 ] 
}