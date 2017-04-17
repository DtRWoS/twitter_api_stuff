# twitter_api_stuff
Generic API to access twitter publically

Super simple Twitter "client" consumes public API's using headless oauth - initialls designed in direct response to a request for code test.
Single basic default controller to show tweets for pre-defined user - and initial reqs requested that @'s link to respective timelines.

Setup:
(With Ruby and basic dependencies of RoR installed - ie gem && bundler)
Git clone Repo
Bundle install
rails s

(basic auth in place for web frontend user:user; pass:pass)

-Intended for use with Ruby 2.2.3 (Per ruby-version)
if using RVM this will be automatically selected or a warning issued if unavailable

Known issues - nokogiri version issues in certain versins of fedora (RHEL)
