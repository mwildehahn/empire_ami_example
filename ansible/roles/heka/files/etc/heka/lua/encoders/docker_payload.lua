require "table"

function process_message()
    local prefix = {}
    local container_name = read_message("Fields[ContainerName]")
    local container_id = read_message("Fields[ContainerID]")
    local payload = read_message("Payload")
    table.insert(prefix, container_name .. "(" .. container_id .. ")")
    local output = table.concat(prefix, " ") .. ": " .. payload .. "\n"
    inject_payload("txt", "DockerPayload", output)
    return 0
end
