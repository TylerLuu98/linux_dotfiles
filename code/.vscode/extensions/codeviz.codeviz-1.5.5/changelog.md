# CodeViz Changelog

## [1.5.5] - 2025-04-30
Better, faster indexing and search that stays up-to-date, and several UI/UX improvements:
- Bring back quick search, navigates the repo agentically
- Add user feedback collection
- More robust graph updates from file changes
- Fixed issues with stale data and regenerate button clears stale data
- Attaching files shows them in the editor and now works for restricting quick search results
- Improved file detection, now completely synched with .gitignore
- Improved prompt; fixed bug with duplicate code lines, treat files as continuous units
- Add better error handling in UI
- Shortcut for opening CodeViz in new window
- Added improved token system
- Anchor UX updates

## [1.5.4] - 2025-04-22
- Temporarily disable quick search
- Improved incremental updates
- Reduced cache size
- Fix bug where only one diagram history item was shown
- Stop autotrigger of initial diagram
- Include mermaid diagram in prompt
- Hard reset option in settings 
- Fix buggy layout of deep research

## [1.5.3, 1.5.2] - 2025-04-17
- Add Open in Separate Window Command
- Fix upstream navigation in call graph
- Include file name and color coordination on live graph
- Fix scaling with base-level nodes
- Incremental graph updates are faster and require fewer resources 

## [1.5.1] - 2025-04-16
- Added support for all operating systems
- Added diagram exports for all diagram types
- Show more of the initial diagram
- Fix bug with call graph anchoring
- Improve search UI/UX
- Fixed bug with deep research query layout

## [1.5.0] - 2025-04-15
- Low latency, high-coverage system diagram generation
- Low latency semantic search
- High-accuracy Deep research tool for codebase exploration
- Anchor Node Mechanism for call graph navigation 
- Real-Time Codebase Map Updates
- Language support for Javascript, Typescript, Python, Java, C#, Ruby, Rust, and PHP

## [1.4.55] - 2025-04-11
- Fix file depth bug preventing codebase map generation
- Add option to prevent CodeViz from auto opening

## [1.4.54, 1.4.53] - 2025-03-08
- Improved file search efficiency
- Fixed error caused by recursive depth

## [1.4.52] - 2025-03-02
- Sync telemetry collection with VS Code telemetry settings
- No longer use git for user verification
- Update README and privacy policy
- Fix race conditions with subscription status

## [1.4.51] - 2025-03-01
- Fixed ENAMETOOLONG error for large workspaces on Windows
- Created placeholder webview when no workspace is found, removed notification
- Fixed race condition causing initial diagram generation to stall indefinitely

## [1.4.50, 1.4.49, 1.4.48] - 2025-02-28
- Fix use of .gitignore for exclude patterns when generating diagrams, improving prompts and relevance of diagram file context
- Fix telemetry bugs, prompt reload of window on state change
- Fix Sync button hitting local cache
- Improve performance of directory structure reads
- Add auto update settings, sync with VS Code Marketplace directly
- Remove notification when no workspace is found, add placeholder webview

## [1.4.47] - 2025-02-26
- Manually trigger base diagram generation
- Fix 'fetch is not defined' error
- Improved error handling and error UI
- Performance improvements

## [1.4.46] - 2025-02-26
- Increased number of free daily flows from 2 to 3
- Improved clarity of flow count usage
- Improved syncing of CodeViz subscription with Stripe
- Improved tutorial

## [1.4.45] - 2025-02-24
- Indefinite diagram loading state fix
- Query suggestion improvements

## [1.4.44] - 2025-02-22
- Fix issue where occasional node clicks would crash CodeViz
- Reduce edge label clutter
- Temporarily disabled v1.5 beta

## [1.4.43, 1.4.42] - 2025-02-19
- Increased accuracy of search by including more files during diagram generation
- Improved quality of click callback selections
- Changed auto-open on first install to only open focused windows
- Fixed bug where diagram generation fails with token counting issues

## [1.4.41] - 2025-02-17
- Update 'open CodeViz' keyboard shortcut

## [1.4.40] - 2025-02-14
- Improved clarity of code links
- Fixed sizing issue with text input container
- Improved auto updates
- Added timeout to graph generation and fixed loading status

## [1.4.39] - 2025-02-13
- Generate faster, more precise click callbacks
- Show natural langauge descriptions of nodes and edges
- Improved search, bug fixes, and UX for attaching files and directories to prompt
- Fixed bug where code links are hidden behind nodes
- Enable all file extensions by default - no more manual configuration
- Initial improvements to making a systematic UI across themes
- Temporarily disabled keyboard navigation
- Enable top-level diagram cache for v1.5 beta

## [1.4.38] - 2025-02-12
- Improved layout
- Increased quality of base-level diagram
- Fixed bug with inconsistent node sizes
v1.5 Beta updates:
- Add local caching
- Improved edge labels
- Increased speed and quality of diagrams

## [1.4.37] - 2025-02-07
CodeViz v1.5 beta release - still early, more coming soon!
In addition:
- improved layout stability
- Edge code links propagate to groups

## [1.4.35, 1.4.36]- 2025-02-01:
- auto-suggested query improvements
- usability improvements with custom search

## [1.4.34]- 2025-02-01:
- visualize directories
- minor bug fixes

## [1.4.32 - 1.4.33 ]- 2025-01-22
- Added more substantially more detail for user generated diagrams

## [1.4.28 - 1.4.31] - 2025-01-18
- Add Keyboard shortcuts
- Usability and reliability improvements

## [1.4.27, 1.4.26, 1.4.25] - 2025-01-15
- Fixed initialization bug in extension activation
- Fixed file path issue on Windows

## [1.4.24] - 2025-01-15
- Updated Tutorial and onboarding
- Consolidated state management for improved performance

## [1.4.23] - 2025-01-14
- Improvements to web and remote file support
- Improved Node UI
- Speed increase for large repositories
- Show subscription renewal date in settings

## [1.4.22] - 2025-01-09
- Settings UI improvements
- Add server side caching for (public) repos on web extension

## [1.4.21] - 2025-01-07
Share CodeViz diagrams directly with others:
- Added support for generating shareable keys and importing diagrams
- Consolidated toolbar
- Miscellaneous color scheme improvements

## [1.4.20] - 2025-01-05
Miscellaneous quality of life improvements
- Avoid unnecessary tutorial
- Stop diagram layout reset on code links and description change
- Fix occassional node color issues
- Preserve query on file attachment
- Extension logo update
- Improved error handling

## [1.4.19] - 2024-12-28
- Added support for capitalized file extensions
- Fixed flow count
- Local caching bug fixes

## [1.4.18] - 2024-12-27
- Added support for additional file types (assembly, basic)
- Added supported file types to settings
- Added web support for VS Code extension
- Miscellaneous UX improvements

## [1.4.16, 1.4.15] - 2024-11-28
Tutorial and performance improvements:
- Walkthrough of CodeViz features
- Miscellaneous performance improvements

## [1.4.14] - 2024-11-26
Agentic navigation improvements, draw.io exports, and quality of life improvements:
- Diagram generation improvements through agentic flow
- Added draw.io export
- Improved settings UI and subscription management
- Added persistence to custom flow generation
- Added regenerate diagram and error reporting to settings
- Miscellaneous bug fixes, including existing subscription resolution bug

## [1.4.13, 1.4.12, 1.4.11, 1.4.10] - 2024-11-19
Code callback improvements and bug fixes:
- Click callback results bug fix & UI improvements
- Allow multiple callback results in same file
- Added tooltip to edge labels
- Increased speed and fixed context window issue with context attachments
- Fix subscription resolution bug
- Fix auto update incorrect failure warning
- Performance improvements
- Added changelog

## [1.4.9] - 2024-11-18
Stripe subscription fixes:
- Fixed duplicate subscriptions
- Subscription confirmation and cancellation routing 

## [1.4.8, 1.4.7] - 2024-11-15
Performance and user experience improvements:
- Optimized file processing for faster startup and analysis
- Enhanced loading interface with clearer status indicators
- Added performance monitoring for faster response times
- Implemented progressive file loading for better responsiveness
- Improved LLM file content parsing
- Local caching of CPU-intensive file processing for large codebases
- Removed deprecated VS Code commands

## [1.4.6] - 2024-11-14
Enhanced reliability and error handling:
- Added comprehensive error tracking and monitoring
- Implemented 5-minute timeout for diagram generation
- Added retry options for failed generations
- Enhanced query system with improved suggestions
- Miscellaneous UI and error handling improvements

## [1.4.5] - 2024-11-13
Visualization and update improvements:
- Added technical description tooltips for diagram nodes
- Implemented automated update checking
- Enhanced graph visualization and layout algorithms
- Improved diagram caching and loading states

## [1.4.4] - 2024-11-12
Improved code analysis performance and location tracking:
- Enhanced code location detection with support for up to 5 relevant sections per node/edge
- Improved responsiveness of diagram interactions
- Added detailed error reporting and debugging capabilities
- Temporarily disabled Git diff visualization features

## [1.4.3, 1.4.2, 1.4.1] - 2024-11-11
Major visualization and performance updates:
- Changed diagram generation to require explicit user initiation
- Enhanced diagram layouts with smoother edge routing
- Added intelligent group handling with animated view fitting
- Added parallel processing for faster diagram generation
- Improved animation performance and responsiveness
- Added safeguards against concurrent operations
- Enhanced tooltip positioning and layering
- Optimized diagram generation with improved caching
- Implemented VS Code theme-aware styling for better integration
- Implemented daily reset for free tier flow count

## [1.4.0] - 2024-11-09
Complete layout engine overhaul and node expansion system:
- Significant generation speed and accuracy improvements
- Merged layout views into a single frame
- Redesigned diagram layout system for improved clarity
- Added expandable nodes showing internal component details
- Improved local caching for faster diagram updates
- Mermaid diagram exports

<img src="https://firebasestorage.googleapis.com/v0/b/codeviz-c3275.appspot.com/o/changelog%2Fv1.4.9.png?alt=media&token=4b5edf8c-184d-4eac-8c04-5805f038d18e" height="500" alt="v1.4.9 screenshot">

## [1.3.18 - 1.3.0] - 2024-08/10
Major platform improvements and feature additions:
- Significant generation speed and accuracy improvements
- Added System Flow tab with preset prompts and enhanced navigation
- Added interactive diagram navigation with code snippet highlighting
- Improved visualization with drag-and-drop positioning and zoom controls
- Implemented workspace-specific diagram history and state management
- Enhanced diagram generation with cancellation support and progress tracking
- Implemented subscription management with 7-day free trial
- Enhanced UI with theme integration and improved layouts
- Added comprehensive error tracking and performance monitoring

<img src="https://firebasestorage.googleapis.com/v0/b/codeviz-c3275.appspot.com/o/changelog%2Fv1.3.18.png?alt=media&token=d0945b2a-23e5-43da-b3ff-fff0b712fd29" height="500" alt="v1.3.18 screenshot">

## [1.2.27 - 1.2.0] - 2024-08
Core functionality and stability improvements:
- Added visualization system with AI-powered analysis
- Improved diagram generation and navigation
- Enhanced performance with parallel processing
- Added automatic updates and analytics systems
- Enhanced error handling and system stability
- Improved file watching and database management
- Added comprehensive documentation

<img src="https://firebasestorage.googleapis.com/v0/b/codeviz-c3275.appspot.com/o/changelog%2Fv1.2.27-1.png?alt=media&token=7d36c5d9-bea8-41b8-ab55-c17ff588cde1" height="500" alt="v1.2.27-1 screenshot">
<img src="https://firebasestorage.googleapis.com/v0/b/codeviz-c3275.appspot.com/o/changelog%2Fv1.2.27-2.png?alt=media&token=8f1f2b9e-b4bf-4c8c-b9d6-00d4f3591884" height="500" alt="v1.2.27-2 screenshot">

## [1.1.6 - 1.1.0] - 2024-07
Architecture and progress tracking:
- Added architecture generation system
- Improved diagram layout and visualization
- Enhanced component organization
- Implemented visual progress tracking
- Added URI handler for integration with codebase changes

<img src="https://firebasestorage.googleapis.com/v0/b/codeviz-c3275.appspot.com/o/changelog%2Fv1.1.6.png?alt=media&token=cbbf0615-2d6c-40b4-b534-034ea9fbbba0" height="500" alt="v1.1.6 screenshot">

## [1.0.2 - 0.0.1] - 2024-07
First major release:
- Added core diagram generation
- Added AI integration
- Added codebase analysis
- Added VS Code integration
- Added preferences management
- Added comprehensive session management
- Added analytics system with privacy controls
- Implemented user interaction tracking

<img src="https://firebasestorage.googleapis.com/v0/b/codeviz-c3275.appspot.com/o/changelog%2Fv1.0.2.png?alt=media&token=8676dd79-d886-4170-a5c0-35f65bfc79c2" height="500" alt="v1.0.2 screenshot">