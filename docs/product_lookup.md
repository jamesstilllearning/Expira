# Product lookup data sources

ExPIRA checks its local product catalog first. For uncached barcodes it uses
the Open Facts universal product endpoint (`product_type=all`) on
`world.openfoodfacts.org`, which routes food, beauty, and general products.
The API requires an identifying User-Agent and currently documents 15 product
read requests per minute per IP/user. The data is open under ODbL; review the
[Open Food Facts API and reuse terms](https://openfoodfacts.github.io/openfoodfacts-server/api/)
before distributing catalog data, and provide appropriate attribution when
using this data publicly.

Only a miss or unusable Open Facts response proceeds to UPCitemdb's
`/prod/trial/lookup` endpoint. Its current free Explorer allowance is 100
combined requests per day, without signup or an API key, with additional burst
limits (currently six lookups per minute). Limits and terms can change. ExPIRA
does not use paid credentials and sends only the barcode.

Successful results are cached per normalized barcode. Confirmed no-match
results are suppressed for one day; temporary provider/network failures are
held for two minutes. The household item remains independent and retains its
own name, category, expiration, quantity, and location.
