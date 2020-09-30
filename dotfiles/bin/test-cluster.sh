declare -a parts
parts=($(kubectl config current-context | tr "_" " "))
project="${parts[1]}"
region="${parts[2]}"
cluster="${parts[3]}"

clusterDB="${HOME}/.clusters"
data=$(yq -j r $clusterDB | jq -c)

clusterName=$(echo $data | jq -r ".clusters | with_entries(select(.value.project == \"$project\" and .value.region == \"$region\" and .value.cluster.name == \"$cluster\")) | keys[0]")
echo $n
