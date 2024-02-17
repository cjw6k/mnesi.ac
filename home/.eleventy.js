const config = require("./content/_data/config");
const setupEleventy = require("./src/11ty/setup");

module.exports = function (eleventyConfig) {
    setupEleventy(eleventyConfig);

    return {
        dir: {
            input: 'content',
            output: config.build.outputDir,
            layouts: '_includes/layouts',
        }
    }
};
