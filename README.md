# Holiday

Holiday is a gem that lets you configure holidays for multiple countries with YAML.

## Default Usage

First setup path to a YAML file and set the country code.

```ruby

Holiday.yaml_file = "/path/to/yaml/holiday.yml"
Holiday.country = "US"

```

You can query for dates
```ruby

# Defaults to current year
Holiday.find("christmas")
Holiday.find("labour day")

```

Or supply a year
```ruby

# Can supply the year as optional argument
Holiday.find(:christmas, 2005)
Holiday.find(:thanksgiving, 1999)

```

## Configuration

There is a default YAML file bundled with this gem. However, the list of holidays and countries is not complete. You
can point to your own file

```ruby
Holiday.yaml_file = "/path/to/your/file/holiday.yml"
```

You can set the country, with country code, as well

```ruby
Holiday.country = "US"
```

## YAML

The YAML format for Holiday is as follows

```yaml
holiday:
  US:
    christmas:
      when: december 25th
      as: christmas
    halloween:
      when: october 31st
      as: halloween, all hallows eve
    labor_day:
      when: 1st monday in september
      as: labor day, labour day
    thanksgiving:
      when: 4th thursday in november
      as: thanksgiving, turkey day
```

Holidays are scoped by country code. Each holiday needs both "when" and "as" keys. The "when" key can either be an exact
month and day, or the occurrence of the holiday in the given month. E.g., "1st monday in september".

The "as" key is used to identify holidays by alternate names and spellings. For instance, "thanksgiving" and "turkey day" should both
point to the 4th thursday in november.

```ruby

Holiday.find("turkey day")
Holiday.find(:thanksgiving)

```

## Other methods

There are a few other methods that may be useful

```ruby

Holiday.all # array containing all keys and alternate names of holidays from yaml file
Holiday.scan("a string containing a holiday by name, like christmas") # => christmas
Holiday::Query.find("all hallows eve") # => october 31st

```