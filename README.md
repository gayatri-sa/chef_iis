# iis

TODO: Enter the cookbook description here.

## Databag commands to get this cookbook to work
knife data bag create common
knife data bag create common company_info
{
  "id": "company_info",
  "name": "Schogini Systems Pvt Ltd",
  "email": "gayatri@schogini.com",
  "website": "http://schogini.com",
  "copyright": "1999-2021",
  "moto": "Making IT work for you"
}
knife data bag show common company_info
knife data bag show common
knife data bag edit common company_info
