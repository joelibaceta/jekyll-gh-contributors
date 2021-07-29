# frozen_string_literal: true

require 'net/http'
require 'uri'
require 'jekyll'
require 'jekyll-gh-contributors/version'

module Jekyll
  class ContributorsTag < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      @content = text
    end

    def getContributors(repo_url)
      uri = URI.parse("https://api.github.com/repos/#{repo_url}/contributors")
      response = Net::HTTP.get_response(uri)

      contributors = JSON.parse(response.body)
      contributors
    end

    def render(context)

      repo_url = "#{context[@content.strip]}"
      contributors = getContributors(repo_url)

      element = "<style>.contributors{margin-top:30px;display:flex;flex-flow:row wrap}.contributors .contributor{width:39px;padding:1px}</style>"

      element += "<div class='contributors scrollbar'>"
      contributors.each do |contributor|
        element += "<div class='contributor'>"
        element += "    <a href='#{contributor['html_url']}' title='#{contributor['title']}'>"
        element += "        <img class='User__image' src='#{contributor['avatar_url']}'>"
        element += '    </a>'
        element += '</div>'
      end
      element += '</div>'
      element
    end
  end
end

Liquid::Template.register_tag('gh_contributors', Jekyll::ContributorsTag)
