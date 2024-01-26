# kong-plugin-backend-token-creation
:bangbang: **This code is just an example on how custom plugins are developed.** 
 **This is not supported by Kong or meant to be used in any production environment.** :bangbang:

## How deploy this plugins

1) clone this repository
2)  execute the following command to create a config map
```
kubectl create configmap backend-token --from-file=./github/kong-plugin-backend-token-creation/kong/plugins/backend-token-creation -n kong-enterprise 
```

3) in the values.yaml of the Kong Gateway data plane add:
```

env:
    plugins: backend-token-creation
plugins: 
  configMaps:
  - name: bbackend-token-creation
    pluginName: backend-token-creation
```

4) add custom plugin to Konnect control plane
    - Select Plugins and ```New Plugin``` Button
    - select ```Custom Plugins``` and ```create```
 ![Alt text](images/custom-plugin.png?raw=true "Kong - Plugin")

    - select the ```schema.lua``` file and click ```save```
![Alt text](images/create-custom-plugin.png?raw=true "Kong - Plugin")
- now the plugin is available in this control plane.

## How to use the plugin

1) Select the route or service where you want to add the plugin
2) Configure the plugin with 
   1) Token URL of the token endpoint
   2) Client ID
   3) Client Secret and if needed
   4) Scope(s)
   5) Credentials send in Auth header or body

![Alt text](images/configure-plugin.png?raw=true "Kong - Plugin")
