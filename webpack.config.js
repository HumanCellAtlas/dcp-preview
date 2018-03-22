/**
 * Human Cell Atlas
 * https://www.humancellatlas.org/
 *
 * Webpack configuration.
 */

const { dirname, join } = require("path");

module.exports = [{
    entry: "./styles/hca/styles.scss",
    output: {
        filename: "style-bundle.js"
    },
    module: {
        rules: [{
            test: /\.scss$/,
            use: [
                {
                    loader: "file-loader",
                    options: {
                        name: "bundle.css",
                    }
                },
                { loader: "extract-loader" },
                { loader: "css-loader" },
                {
                    loader: "sass-loader",
                    options: {
                        includePaths: [
                            join(dirname(module.filename), "node_modules")
                        ]
                    }
                }
            ]
        }]
    }
}];
