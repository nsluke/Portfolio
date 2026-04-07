import { useState } from 'react'
import './Projects.css'

const projects = [
  {
    name: 'Treachery',
    description: 'Multiplayer MTG Variant for iOS',
    tech: 'Swift',
    github: 'https://github.com/paintedlabs/Treachery-FrontEnd',
    liveUrl: 'https://treachery.games',
    liveLabel: 'Play',
    longDescription: 'A multiplayer Magic: The Gathering variant app for iOS that brings the Treachery format to your phone. Play with friends in real-time with role-based gameplay.',
    screenshot: null, // TODO: add screenshot path e.g. '/screenshots/treachery.png'
  },
  {
    name: 'The Lazer Dragon Workout Experience',
    description: 'Think you can take on the Lazer Dragon?',
    tech: 'Swift',
    github: 'https://github.com/nsluke/Lazer-Dragon-Workout-Experience',
    liveUrl: 'https://testflight.apple.com/join/Uv2Xufqr',
    liveLabel: 'TestFlight',
    longDescription: 'An iOS workout app disguised as a boss battle. Complete exercises to deal damage to the Lazer Dragon — skip reps and face the consequences.',
    screenshot: null,
  },
  {
    name: 'Claudius',
    description: 'Track your claude usage right in your menu bar',
    tech: 'Swift',
    github: 'https://github.com/nsluke/Claudius',
    liveUrl: 'https://github.com/nsluke/Claudius/releases',
    liveLabel: 'Download',
    longDescription: 'A macOS menu bar app that tracks your Claude API usage in real-time. See spend, token counts, and usage trends at a glance without leaving your workflow.',
    screenshot: null,
  },
  {
    name: 'Manadrain',
    description: 'Stash your favorite cards for later.',
    tech: 'TypeScript',
    github: 'https://github.com/nsluke/manadrain',
    liveUrl: 'https://addons.mozilla.org/en-US/firefox/addon/manadrain-mtg-shopping-list/',
    liveLabel: 'Firefox Add-on',
    longDescription: 'A Firefox browser extension that lets you save Magic: The Gathering cards to a shopping list while browsing. Quickly stash cards you want to buy later.',
    screenshot: null,
  },
  {
    name: 'Planechase Bot',
    description: 'Discord bot for playing Planechase',
    tech: 'Python',
    github: 'https://github.com/nsluke/Planechase-Bot',
    longDescription: 'A Discord bot that manages Planechase games for Magic: The Gathering. Handles plane cards, dice rolls, and game state so your group can play Planechase remotely.',
    screenshot: null,
  },
  {
    name: 'PushPush',
    description: 'The First game I ever made. Aged like fine wine.',
    tech: 'Objective-C',
    github: 'https://github.com/nsluke/PushPush',
    liveUrl: 'https://testflight.apple.com/join/wRBak44b',
    liveLabel: 'TestFlight',
    longDescription: 'The very first iOS game I ever built. A simple but addictive pushing game written in Objective-C. Still holds up after all these years.',
    screenshot: null,
  },
  {
    name: 'Mock Starket',
    description: 'Buy REAL fake stocks and lose real fake money',
    tech: 'Swift',
    github: 'https://github.com/nsluke/Mock-Starket-iOS',
    longDescription: 'A mock stock trading app for iOS. Practice trading with fake money and real-ish market data. Perfect for learning without the financial consequences.',
    screenshot: null,
  },
  {
    name: 'Bling My Deck',
    description: 'Find the most expensive printing of every card in your MTG deck',
    tech: 'TypeScript',
    github: 'https://github.com/nsluke/blingmydeck',
    liveUrl: 'https://blingoutmydeck.com',
    liveLabel: 'Visit',
    longDescription: 'A web tool that finds the most expensive printing of every card in your Magic: The Gathering deck. Paste your decklist and see just how much it would cost to fully bling it out.',
    screenshot: null,
  },
]

function Projects() {
  const [hovered, setHovered] = useState(null)
  const [selected, setSelected] = useState(null)

  const toggleProject = (i) => {
    setSelected(selected === i ? null : i)
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
              onMouseEnter={() => selected === null && setHovered(i)}
              onMouseLeave={() => setHovered(null)}
              onClick={() => toggleProject(i)}
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
