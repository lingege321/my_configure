---
description: JIRA jiradc.api Library - Complete Reference
globs:
alwaysApply: false
---

# JIRA jiradc.api Library

## Agent Identity Declaration Format

```
🔍 **[JIRA Agent]**
[Response content...]
```

## Session Initialization

You need to source the jira.env file before using the jiradc.api library.

```bash
source jira.env
```

```python
#!/depot/Python/Python-3.13.3/bin/python
import jiradc
session = jiradc.api.Session('prod')
```

## 1. Read an Issue

**Method**: `session.get_issue(issue_key_or_star_id)`

Returns `StandardIssue`, `SubTaskIssue`, or STAR subclass object. Returns `None` if not found.

```python
issue = session.get_issue('P80014691-29242')  # or STAR ID: '9000642618'
if not issue:
    print('cannot find issue')
else:
    print('Summary:', issue.summary, 'Status:', issue.status)
    print(issue)  # Print all attributes
```

**Key Attributes**: `key`, `star_id`, `summary`, `status`, `priority`, `issue_type`, `assignee`, `assignee_name`, `reporter`, `created`, `updated`, `description`, `subtask` (Boolean), `parent`

**STAR Subclasses**: `STAR`, `Epic`, `Feature`, `Story`, `Task`, `STARSubTask`, `SubTask`, `Workaround`, `ReleaseNote`, `TestPlan`, etc.

## 2. Search for Issues

**Method**: `session.search_issues(jql, start_at=0, max_results=0)`

Returns tuple: `(issue_keys_list, total_found, errors_list)`

```python
(issue_keys, total_found, errors) = session.search_issues('filter="My Filter Name"')

for issue_key in issue_keys:
    issue = session.get_issue(issue_key)
    if issue and not issue.subtask:  # Filter standard issues only
        print(issue.key, 'Status:', issue.status, 'Summary:', issue.summary)

print(f'{len(issue_keys)} returned - {total_found} found')
```

**Best Practice**: Store complex JQL as filters in Jira UI, then invoke: `'filter="My Filter Name"'`

## 3. Create an Issue

**3-Step Process**: (1) Instantiate empty object, (2) Set attributes, (3) Call `create()`

Returns tuple: `(issue_key, errors_list)`

### STAR Issues

```python
issue = jiradc.api.STAR(session)
issue.issue_type = 'bug'  # or 'enhancement'
issue.summary = 'test STAR'
issue.product_l1 = '80005259'
issue.product_l2 = '80005262'
issue.found_version = 'n-2019.03'
issue.os_affected = ['All Linux', 'All Windows']
issue.occurred_at = 'production - internal'
issue.category = 'bad results'
issue.customer_severity = 'low'
issue.description = 'test description'
issue.customer_cases = ['8000000003']
issue.reporter = 'your_user_id'

(issue_key, errors) = issue.create()
if issue_key:
    print('New Issue Key:', issue_key)
for error in errors:
    print(error)
```

### STAR Sub-Tasks

```python
issue = jiradc.api.Workaround(session)  # or ReleaseNote, TestPlan, etc.
issue.parent = 'P80005259-12345'
issue.summary = 'Workaround sub-task'
issue.description = 'Details here'

(issue_key, errors) = issue.create()
```

### Non-STAR Standard Issues

```python
issue = jiradc.api.StandardIssue(session)
issue.project = 'IS'
issue.issue_type = 'task'  # or 'bug', 'enhancement', 'epic', 'story'
issue.summary = 'Test Task'
issue.fix_versions = 'future releases'
issue.components = 'api'
issue.description = 'Test description'

(issue_key, errors) = issue.create()
```

### Non-STAR Sub-Tasks

```python
issue = jiradc.api.SubTaskIssue(session)
issue.parent = 'IS-918'
issue.issue_type = 'sub-task'
issue.summary = 'Sample Sub-Task'
issue.fix_versions = ['future releases', 'parked']  # Multiple values
issue.components = ['api', 'email']

(issue_key, errors) = issue.create()
```

**Key Rules**:
- STAR: Project derived from `product_l1`; priority derived from `customer_severity`
- Always use ID attributes (e.g., `product_l1`, not `product_l1_name`)
- Multiple values: Use Python lists `['value1', 'value2']`

## 4. Update an Issue

**Method**: `issue.update()`

Returns tuple: `(success_boolean, errors_list)`

```python
issue = session.get_issue('P80014691-29242')
if issue:
    issue.summary = 'Updated summary'
    issue.assignee = 'new_user_id'
    issue.customer_severity = 'high'
    
    (success, errors) = issue.update()
    if success:
        print('Issue updated successfully')
    for error in errors:
        print(error)
```

**Note**: Only modified attributes are updated. Retrieve issue first, modify, then call `update()`.

## 5. Methods Available on Issue Objects

### Common Methods

- `issue.update()` - Save changes to issue
- `issue.add_comment(comment_text)` - Add comment
- `issue.add_attachment(file_path)` - Attach file
- `issue.delete_attachment(attachment_id)` - Remove attachment
- `issue.add_watcher(user_id)` - Add watcher
- `issue.remove_watcher(user_id)` - Remove watcher
- `issue.transition(status_name)` - Change status (if transition available)

```python
issue = session.get_issue('P80014691-29242')
issue.add_comment('This is a comment')
issue.add_attachment('/path/to/file.txt')
issue.add_watcher('userid')
issue.transition('In Progress')
```

## 6. Functions for List Attributes

**Methods**: Get valid values for list-based fields

```python
# Get available values for fields
priorities = session.get_priorities(project_key)
statuses = session.get_statuses(project_key)
issue_types = session.get_issue_types(project_key)
components = session.get_components(project_key)
versions = session.get_versions(project_key)

# For STAR projects
products = session.get_products()
os_list = session.get_os_affected()
categories = session.get_categories()
```

**Usage**: Query these before creating/updating issues to ensure valid values

## 7. Field Mappings

**Access**: Use `issue.__dict__` or `print(issue)` to see all available fields

Common ID/Name pairs (always use ID for updates):
- `product_l1` / `product_l1_name`
- `assignee` / `assignee_name`
- `reporter` / `reporter_name`
- `logo` / `logo_name` (customer)
- `manager` / `manager_name`

## Best Practices

1. **Always check return values**: `None` for `get_issue()`, empty string for failed `create()`
2. **Handle errors**: Check `errors` list from `create()`, `update()`, `search_issues()`
3. **Use filters**: Store complex JQL in Jira UI, reference by name
4. **ID vs Name**: Always set ID attributes, not name attributes
5. **Multiple values**: Use Python lists for multi-value fields
6. **Session environment**: Use correct environment ('qa', 'prod')
7. **Check subtask**: Use `issue.subtask` to distinguish standard vs sub-task issues
8. **Print for debugging**: `print(issue)` shows all attributes and values

## Quick Reference

```python
# Read
issue = session.get_issue('KEY')

# Search
(keys, total, errors) = session.search_issues('project=PROJ AND status=Open')

# Create STAR
issue = jiradc.api.STAR(session)
issue.summary = 'Test'
issue.product_l1 = '80005259'
(key, errors) = issue.create()

# Update
issue.summary = 'New summary'
(success, errors) = issue.update()

# Add comment
issue.add_comment('Comment text')
```
