import { useState } from 'react'
import './Projects.css'

const projects = [
  {
    name: 'Treachery',
    slug: 'treachery',
    description: 'Multiplayer MTG Variant for iOS',
    tech: 'Swift',
    github: 'https://github.com/paintedlabs/Treachery-FrontEnd',
    liveUrl: 'https://treachery.games',
    liveLabel: 'Play',
    longDescription: 'A multiplayer Magic: The Gathering variant app for iOS that brings the Treachery format to your phone. Play with friends in real-time with role-based gameplay.',
    screenshot: '/screenshots/treachery.png', // TODO: add screenshot path e.g. '/screenshots/treachery.png'
  },
  {
    name: 'The Lazer Dragon Workout Experience',
    slug: 'lazer-dragon',
    description: 'Think you can take on the Lazer Dragon?',
    tech: 'Swift',
    github: 'https://github.com/nsluke/Lazer-Dragon-Workout-Experience',
    liveUrl: 'https://testflight.apple.com/join/Uv2Xufqr',
    liveLabel: 'TestFlight',
    longDescription: 'An iOS workout app disguised as a boss battle. Complete exercises to deal damage to the Lazer Dragon — skip reps and face the consequences.',
    screenshot: '/screenshots/lazer-dragon.png',
  },
  {
    name: 'Claudius',
    slug: 'claudius',
    description: 'Track your claude usage right in your menu bar',
    tech: 'Swift',
    github: 'https://github.com/nsluke/Claudius',
    liveUrl: 'https://github.com/nsluke/Claudius/releases',
    liveLabel: 'Download',
    longDescription: 'A macOS menu bar app that tracks your Claude API usage in real-time. See spend, token counts, and usage trends at a glance without leaving your workflow.',
    screenshot: '/screenshots/claudius.png',
  },
  {
    name: 'Manadrain',
    slug: 'manadrain',
    description: 'Stash your favorite cards for later.',
    tech: 'TypeScript',
    github: 'https://github.com/nsluke/manadrain',
    liveUrl: 'https://addons.mozilla.org/en-US/firefox/addon/manadrain-mtg-shopping-list/',
    liveLabel: 'Firefox Add-on',
    longDescription: 'A Firefox browser extension that lets you save Magic: The Gathering cards to a shopping list while browsing. Quickly stash cards you want to buy later.',
    screenshot: '/screenshots/manadrain.png',
  },
  {
    name: 'PushPush',
    slug: 'pushpush',
    description: 'The First game I ever made. Aged like fine wine.',
    tech: 'Objective-C',
    github: 'https://github.com/nsluke/PushPush',
    liveUrl: 'https://testflight.apple.com/join/wRBak44b',
    liveLabel: 'TestFlight',
    longDescription: 'The very first iOS game I ever built. A simple but addictive pushing game written in Objective-C. Still holds up after all these years.',
    screenshot: '/screenshots/pushpush.png',
  },
  {
    name: 'Bling My Deck',
    slug: 'bling-my-deck',
    description: 'Find the most expensive printing of every card in your MTG deck',
    tech: 'TypeScript',
    github: 'https://github.com/nsluke/blingmydeck',
    liveUrl: 'https://blingoutmydeck.com',
    liveLabel: 'Visit',
    longDescription: 'A web tool that finds the most expensive printing of every card in your Magic: The Gathering deck. Paste your decklist and see just how much it would cost to fully bling it out.',
    screenshot: '/screenshots/bling-my-deck.png',
  },
]

function Projects() {
  const [hovered, setHovered] = useState(null)
  const [selected, setSelected] = useState(null)

  const toggleProject = (i) => {
    setSelected(selected === i ? null : i)
  }

  const handleKeyDown = (e, i) => {
    if (e.key === 'Enter' || e.key === ' ') {
      e.preventDefault()
      toggleProject(i)
    }
  }

  return (
    <section className="projects" id="projects">
      <div className="projects-header">
        <span className="section-label">Selected Work</span>
        <span className="project-count">{projects.length} Projects</span>
      </div>
      <div className="projects-list">
        {projects.map((project, i) => {
          const isOpen = selected === i

          return (
            <div
              key={project.name}
              className={[
                'project-row',
                hovered !== null && hovered !== i && selected === null ? 'dimmed' : '',
                isOpen ? 'expanded' : '',
              ].filter(Boolean).join(' ')}
              role="button"
              tabIndex={0}
              aria-expanded={isOpen}
              onMouseEnter={() => selected === null && setHovered(i)}
              onMouseLeave={() => setHovered(null)}
              onClick={() => toggleProject(i)}
              onKeyDown={(e) => handleKeyDown(e, i)}
            >
              <div className="project-row-header">
                <div className="project-index">
                  {String(i + 1).padStart(2, '0')}
                </div>
                <div className="project-info">
                  <h3 className="project-name">{project.name}</h3>
                  <p className="project-desc">{project.description}</p>
                  <span className="project-tech">{project.tech}</span>
                </div>
                <div className="project-links">
                  <a
                    href={`/${project.slug}/`}
                    className="project-link project-link-details"
                    onClick={(e) => e.stopPropagation()}
                  >
                    Details
                  </a>
                  <a
                    href={project.github}
                    target="_blank"
                    rel="noopener noreferrer"
                    className="project-link"
                    onClick={(e) => e.stopPropagation()}
                  >
                    GitHub
                  </a>
                  {project.liveUrl ? (
                    <a
                      href={project.liveUrl}
                      target="_blank"
                      rel="noopener noreferrer"
                      className="project-link project-link-live"
                      onClick={(e) => e.stopPropagation()}
                    >
                      {project.liveLabel} -&gt;
                    </a>
                  ) : (
                    <span className="project-link project-link-soon">Coming Soon</span>
                  )}
                </div>
              </div>

              <div className="project-expanded-content">
                <div className="project-expanded-inner">
                  <p className="project-expanded-desc">
                    {project.longDescription || project.description}
                  </p>
                  <div className="project-expanded-screenshot">
                    {project.screenshot ? (
                      <img src={project.screenshot} alt={`${project.name} screenshot`} />
                    ) : (
                      <div className="project-screenshot-placeholder">
                        <span>Screenshot Coming Soon</span>
                      </div>
                    )}
                  </div>
                </div>
              </div>
            </div>
          )
        })}
      </div>
    </section>
  )
}

export default Projects
