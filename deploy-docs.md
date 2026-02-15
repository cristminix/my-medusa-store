```bash
npx medusa build
PWD=`pwd`
cd .medusa/server
cp ../../.env .env.production
cp -r ../../static .

cp -r ../../../server_node_modules.bak node_modules
cd "$PWD"
pm2 start ecosystem.config.js
```

```javascript
// ecosystem.config.js
module.exports = {
    apps: [
        {
            name: "medusa-server",
            cwd: ".medusa/server",
            script: "npm",
            args: "run start",
            env: {
                NODE_ENV: "production",
                PORT: "9001",
            },
            instances: 1, // Adjust based on CPU cores
            autorestart: true,
            watch: false,
        },
    ],
};
```
