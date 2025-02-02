# ------------------------------------------------------------------
# Licensed under the MIT License. See LICENSE in the project root.
# ------------------------------------------------------------------

Makie.plottype(::AbstractVector{<:PointOrGeometry}) =
  Viz{<:Tuple{AbstractVector{<:PointOrGeometry}}}

function Makie.plot!(plot::Viz{<:Tuple{AbstractVector{<:PointOrGeometry}}})
  # retrieve items object
  items = plot[:object]

  # fallback to collection recipe
  viz!(plot, (Makie.@lift Collection($items)),
    color       = plot[:color],
    alpha       = plot[:alpha],
    colorscheme = plot[:colorscheme],
    facetcolor  = plot[:facetcolor],
    showfacets  = plot[:showfacets],
    pointsize   = plot[:pointsize],
    segmentsize = plot[:segmentsize]
  )
end

Makie.plottype(::PointOrGeometry) = Viz{<:Tuple{PointOrGeometry}}

function Makie.plot!(plot::Viz{<:Tuple{PointOrGeometry}})
  # retrieve item object
  item = plot[:object]

  # fallback to vector recipe
  viz!(plot, (Makie.@lift [$item]),
    color       = plot[:color],
    alpha       = plot[:alpha],
    colorscheme = plot[:colorscheme],
    facetcolor  = plot[:facetcolor],
    showfacets  = plot[:showfacets],
    pointsize   = plot[:pointsize],
    segmentsize = plot[:segmentsize]
  )
end

Makie.plottype(::Domain) = Viz{<:Tuple{Domain}}

function Makie.plot!(plot::Viz{<:Tuple{Domain}})
  # retrieve domain object
  domain = plot[:object]

  # fallback to vector recipe
  viz!(plot, (Makie.@lift collect($domain)),
    color       = plot[:color],
    alpha       = plot[:alpha],
    colorscheme = plot[:colorscheme],
    facetcolor  = plot[:facetcolor],
    showfacets  = plot[:showfacets],
    pointsize   = plot[:pointsize],
    segmentsize = plot[:segmentsize]
  )
end
