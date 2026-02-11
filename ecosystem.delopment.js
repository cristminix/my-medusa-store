// ecosystem.config.js
module.exports = {
    apps: [
        {
            name: "medusa-server",
            cwd: ".",
            script: "npm",
            args: "run dev",
            env: {
                NODE_ENV: "development",
                PORT: "9001",
            },
            instances: 1, // Adjust based on CPU cores
            autorestart: true,
            watch: false,
        },
    ],
};
