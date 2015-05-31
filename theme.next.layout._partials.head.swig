{% if theme.rss === '' and config.feed and config.feed.path %}
    {% set theme.rss = config.root + config.feed.path %}
{% endif %}

<meta charset="UTF-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>

{% if theme.google_site_verification %}
  <meta name="google-site-verification" content="{{ theme.google_site_verification }}" />
{% endif %}

{% if config.qihu_site_verification %}
  <meta name="360-site-verification" content="{{ config.qihu_site_verification }}" />
{% endif %}

{% if theme.fancybox %}
  <link rel="stylesheet" type="text/css" href="{{ url_for(theme.vendors) }}/fancybox/source/jquery.fancybox.css?v=2.1.5"/>
{% endif %}

<link rel="stylesheet" type="text/css" href="{{ url_for(theme.css) }}/main.css?v={{ theme.version }}"/>

{% if config.description %}
    <meta name="description" content="{{ config.description }}" />
{% endif %}

{% if page.tags and page.tags.length %}
  <meta name="keywords" content="{% for tag in page.tags %}{{ tag.name }},{% endfor %}" />
{% elif theme.keywords %}
  <meta name="keywords" content="{{ theme.keywords }}" />
{% endif %}

{% if theme.rss %}
  <link rel="alternate" href="{{ url_for(theme.rss) }}" title="{{ config.title }}" type="application/atom+xml" />
{% endif %}

{% if theme.favicon %}
  <!--<link rel="shorticon icon" type="image/x-icon" href="{{ url_for(theme.favicon) }}?v={{ theme.version }}" />-->
  <link rel="apple-touch-icon" sizes="57x57" href="/apple-touch-icon-57x57.png?v={{ theme.version }}">
  <link rel="apple-touch-icon" sizes="60x60" href="/apple-touch-icon-60x60.png?v={{ theme.version }}">
  <link rel="apple-touch-icon" sizes="72x72" href="/apple-touch-icon-72x72.png?v={{ theme.version }}">
  <link rel="apple-touch-icon" sizes="76x76" href="/apple-touch-icon-76x76.png?v={{ theme.version }}">
  <link rel="apple-touch-icon" sizes="114x114" href="/apple-touch-icon-114x114.png?v={{ theme.version }}">
  <link rel="apple-touch-icon" sizes="120x120" href="/apple-touch-icon-120x120.png?v={{ theme.version }}">
  <link rel="apple-touch-icon" sizes="144x144" href="/apple-touch-icon-144x144.png?v={{ theme.version }}">
  <link rel="apple-touch-icon" sizes="152x152" href="/apple-touch-icon-152x152.png?v={{ theme.version }}">
  <link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon-180x180.png?v={{ theme.version }}">
  <link rel="icon" type="image/png" href="/favicon-32x32.png?v={{ theme.version }}" sizes="32x32">
  <link rel="icon" type="image/png" href="/android-chrome-192x192.png?v={{ theme.version }}" sizes="192x192">
  <link rel="icon" type="image/png" href="/favicon-96x96.png?v={{ theme.version }}" sizes="96x96">
  <link rel="icon" type="image/png" href="/favicon-16x16.png?v={{ theme.version }}" sizes="16x16">
  <link rel="manifest" href="/manifest.json?v={{ theme.version }}">
  <meta name="msapplication-TileColor" content="#da532c">
  <meta name="msapplication-TileImage" content="/mstile-144x144.png?v={{ theme.version }}">
  <meta name="theme-color" content="#ffffff">
{% endif %}

{# HEXO CONFIGURATIONS #}
<script type="text/javascript" id="hexo.configuration">
  var CONFIG = {
    scheme: '{{ theme.scheme }}',
    analytics: {
      baidu: '{{ theme.baidu_analytics }}',
      google: '{{ theme.google_analytics }}'
    },
    sidebar: '{{ theme.sidebar }}'
  };
</script>

{% include '../_scripts/analytics/baidu-analytics.swig' %}
