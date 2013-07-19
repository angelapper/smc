{salvus_client} = require('salvus_client')
{top_navbar}    = require('top_navbar')

top_navbar.on "switch_to_page-salvus-help", () ->
    update_stats()

update_stats = () ->
    salvus_client.server_stats
        cb : (err, stats) ->
            if err
                return
            X = $(".salvus-stats").show()
            X.find(".salvus-stats-accounts").text(stats.accounts)
            X.find(".salvus-stats-projects").text(stats.projects)
            X.find(".salvus-stats-active-projects").text(stats.active_projects)

            if stats.hub_servers.length == 0
                n = 0
            else
                n = (x['clients'] for x in stats.hub_servers).reduce((s,t) -> s+t)
            X.find(".salvus-stats-number-of-logged-in-users").text(n)