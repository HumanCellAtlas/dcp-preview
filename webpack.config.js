/**
 * Human Cell Atlas
 * https://www.humancellatlas.org/
 *
 * Webpack configuration.
 */

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
                        importer: function(url) {
                            if(url.indexOf("@material") === 0) {
                                var filePath = url.split("@material")[1];
                                var nodeModulePath = `./node_modules/@material/${filePath}`;
                                return { file: require("path").resolve(nodeModulePath) };
                            }
                            return { file: url };
                        }
                    }
                }
            ]
        }]
    }
}];
