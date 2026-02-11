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
