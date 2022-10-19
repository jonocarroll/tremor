
<!-- README.md is generated from README.Rmd. Please edit that file -->

# tremor

<!-- badges: start -->
<!-- badges: end -->

The goal of tremor is to wrap the
[tremor.js](https://www.tremor.so/docs/getting-started/demo-dashboard)
React library as a htmlWidget.

## Installation

You can install the development version of tremor like so:

``` r
# install.packages("remotes")
remotes::install.github("jonocarroll/tremor")
```

## Caveats

This didn’t end up working. The
[example](https://github.com/tremorlabs/tremor#example) listed is

``` js
<Card maxWidth="max-w-sm">
    <Text>Sales</Text>
    <Metric>$ 71,465</Metric>
    <Flex marginTop='mt-4'>
        <Text>32% of annual target</Text>
        <Text>$ 225,000</Text>
    </Flex>
    <ProgressBar percentageValue={ 32 } marginTop="mt-2" />
  </Card>
```

![](https://github.com/tremorlabs/tremor/raw/main/images/example.png)

The following *does* produce output, but none of the rendering seems to
happen.

``` r
tremor(Text("Sales"), Metric("$ 71,465"))$x$tag
```

<Card>
<Text>Sales</Text>
<Metric>$ 71,465</Metric>
</Card>

The tag appears correct…

``` r
print(tremor(Text("Sales"), Metric("$ 71,465"))$x$tag)
#> <Card>
#>   <Text>Sales</Text>
#>   <Metric>$ 71,465</Metric>
#> </Card>
```

Any suggestions most welcome.

This repo contains probably too many attempts at resolving this, so it
is far from minimal.

I have tried:

- including tailwindcss directly
- including tailwindcss via {shiny.tailwind}
- [updating](https://github.com/jonocarroll/reactR) {reactR} to use
  ^1.8.0
- yelling at it
- fiddling with it
