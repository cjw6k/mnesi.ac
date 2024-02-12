const outputDir = 'website/_site';

module.exports = function (eleventyConfig) {
    eleventyConfig.addPassthroughCopy({'website/public': '/'})

    return {
        dir: {
            input: 'website/src',
            output: outputDir,
            layouts: '_layouts',
        }
    }
};
